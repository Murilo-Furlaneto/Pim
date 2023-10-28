using FolhaDePagamento.Data;
using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.AspNetCore.Http.Connections;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento.Repositorios
{
    public class FuncionarioRepositorio : IFuncionarioRepositorio
    {
        private readonly FolhaDePagamentoDbContext _dbContext;
        public FuncionarioRepositorio(FolhaDePagamentoDbContext folhaDePagamentoDbContext)
        {
            _dbContext = folhaDePagamentoDbContext;
        }
#pragma warning disable CS8603 // Possível retorno de referência nula.
        public async Task<FuncionarioModel> BuscarPorId(int Id) => await _dbContext.Funcionario.FirstOrDefaultAsync(x => x.Id == Id);
#pragma warning restore CS8603 // Possível retorno de referência nula.

        public async Task<List<FuncionarioModel>> BuscarTodosFuncionarios()
        {
            return await _dbContext.Funcionario.ToListAsync();
        }
        public async Task<FuncionarioModel> Adicionar(FuncionarioModel funcionario)
        {
            await _dbContext.Funcionario.AddAsync(funcionario);
            await _dbContext.SaveChangesAsync();
            return funcionario;
        }

        public async Task<FuncionarioModel> Atualizar(FuncionarioModel funcionario, int Id)
        {
            FuncionarioModel funcionarioPorId = await BuscarPorId(Id);
            if (funcionarioPorId == null)
            {
                throw new Exception($"Funcionário para o ID: {Id} não foi encontrado");
            }

            funcionarioPorId.Nome = funcionario.Nome;
            funcionarioPorId.CPF = funcionario.CPF;
            funcionarioPorId.Cargo = funcionario.Cargo;
            funcionarioPorId.Salario = funcionario.Salario;
            funcionarioPorId.HorasTrabalhadas = funcionario.HorasTrabalhadas;
            funcionarioPorId.Comissao = funcionario.Comissao;
            funcionarioPorId.PIS = funcionario.PIS;
            funcionarioPorId.CNH = funcionario.CNH;
            funcionarioPorId.RG = funcionario.RG;
            funcionarioPorId.CertNascimento = funcionario.CertNascimento;
            funcionarioPorId.Endereco = funcionario.Endereco;

            _dbContext.Funcionario.Update(funcionarioPorId);
            await _dbContext.SaveChangesAsync();
            return funcionarioPorId;
        }

        public async Task<bool> Apagar(int Id)
        {
            FuncionarioModel funcionarioPorId = await BuscarPorId(Id);
            if (funcionarioPorId == null)
            {
                throw new Exception($"Funcionário para o ID: {Id} não foi encontrado");
            }

            _dbContext.Funcionario.Remove(funcionarioPorId);
            await _dbContext.SaveChangesAsync();
            return true;
        }

    }
}


