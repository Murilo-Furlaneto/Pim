using FolhaDePagamento.Data;
using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.X509Certificates;

namespace FolhaDePagamento.Repositorios

{
    public class DescontoRepositorio : IDescontoRepositorio
    {
        public float salario = 0;
        private readonly FolhaDePagamentoDbContext _dbContext;
        public DescontoRepositorio(FolhaDePagamentoDbContext folhaDePagamentoDbContext)
        {
            _dbContext = folhaDePagamentoDbContext;
        }
        public async Task<DescontoModel> BuscarPorCodDesconto(int CodDesconto)
        {
            DescontoModel? desconto = await _dbContext.Desconto.FirstOrDefaultAsync(x => x.CodDesconto == CodDesconto);
            return desconto;
        }

        public async Task<DescontoModel> BuscarPorId(int Id)
        {
            return await _dbContext.Desconto.FirstOrDefaultAsync(x => x.Id == Id);
        }
        public async Task<DescontoModel> Adicionar(DescontoModel desconto)
        {
            await _dbContext.Desconto.AddAsync(desconto);
            await _dbContext.SaveChangesAsync();
            return desconto;
        }

        public async Task<DescontoModel> Atualizar(DescontoModel desconto, int CodDesconto)
        {
            DescontoModel descontoPorCod = await BuscarPorCodDesconto(CodDesconto);
            if (BuscarPorCodDesconto == null)
            {
                throw new Exception($"O desconto para o código: {CodDesconto} não foi encontrado");
            }

            descontoPorCod.TaxaInss = desconto.TaxaInss;
            descontoPorCod.Irrf = desconto.Irrf;
            descontoPorCod.Vt = desconto.Vt;
            descontoPorCod.FGTS = desconto.FGTS;

            _dbContext.Desconto.Update(descontoPorCod);
            await _dbContext.SaveChangesAsync();
            return descontoPorCod;

        }
        public async Task<DescontoModel> CalculoDesconto(DescontoModel desconto, int CodDesconto)
        {
            DescontoModel descontoPorCod = await BuscarPorCodDesconto(CodDesconto);
            if (BuscarPorCodDesconto == null)
            {
                throw new Exception($"O desconto para o código: {CodDesconto} não foi encontrado");
            }


            FuncionarioModel funcionario = new FuncionarioModel();
            salario = funcionario.Salario;

            salario -= desconto.Irrf;
            salario -= desconto.FGTS;
            salario -= desconto.Vt;
            salario -= desconto.TaxaInss;

            _dbContext.Funcionario.Update(funcionario);
            await _dbContext.SaveChangesAsync();
            return desconto;

        }
        public async Task<bool> Apagar(int CodDesconto)
        {
            DescontoModel descontoPorCod = await BuscarPorCodDesconto(CodDesconto);
            if (BuscarPorCodDesconto == null)
            {
                throw new Exception($"O desconto para o código: {CodDesconto} não foi encontrado");
            }

            _dbContext.Desconto.Remove(descontoPorCod);
            await _dbContext.SaveChangesAsync();
            return true;


        }

        

    
    }
}
