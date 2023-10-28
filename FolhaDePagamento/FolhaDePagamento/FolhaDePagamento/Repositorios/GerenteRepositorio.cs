using FolhaDePagamento.Data;
using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento.Repositorios
{
    public class GerenteRepositorio : IGerenteRepositorio
    {
        private readonly FolhaDePagamentoDbContext _dbContext;
        public GerenteRepositorio(FolhaDePagamentoDbContext folhaDePagamentoDbContext)
        {
            _dbContext = folhaDePagamentoDbContext;
        }
        public async Task<GerenteModel> BuscarPorId(int Id)
        {
            return await _dbContext.Gerente.FirstOrDefaultAsync(x => x.Id == Id);
        }

        public async Task<GerenteModel> Atualizar(GerenteModel gerente, int Id)
        {
            GerenteModel gerentePorId = await BuscarPorId(Id);
            if (gerentePorId == null)
            {
                throw new Exception($"O gerente para o ID: {Id} não foi encontrado");
            }
            
            gerentePorId.CPF = gerente.CPF;
            gerentePorId.Nome = gerente.Nome;
            gerentePorId.Cargo = gerente.Cargo;
            gerentePorId.Salario = gerente.Salario;
            gerentePorId.HorasTrabalhadas = gerente.HorasTrabalhadas;
            gerentePorId.Comissao = gerente.Comissao;
            gerentePorId.PIS = gerente.PIS;
            gerentePorId.RG = gerente.RG;
            gerentePorId.CertNascimento = gerente.CertNascimento;
            gerentePorId.Endereco = gerente.Endereco;
            gerentePorId.CNH = gerente.CNH;

            _dbContext.Gerente.Update(gerentePorId);
            await _dbContext.SaveChangesAsync();
            return gerentePorId;

        }

        public async Task<bool> Apagar(int Id)
        {
            GerenteModel gerentePorId = await BuscarPorId(Id);
            if (gerentePorId == null)
            {
                throw new Exception($"O gerente para o ID: {Id} não foi encontrado");
            }

            _dbContext.Gerente.Remove(gerentePorId);
            await _dbContext.SaveChangesAsync();
            return true;
        }

    }

}
