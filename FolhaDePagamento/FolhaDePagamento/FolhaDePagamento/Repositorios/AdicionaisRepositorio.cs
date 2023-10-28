using FolhaDePagamento.Data;
using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento.Repositorios
{
    public class AdicionaisRepositorio : IAdicionaisRepositorio
    {
        public float salario = 0;
        public float DecimoTerceiro = 0;

        private readonly FolhaDePagamentoDbContext _dbContext;
        public AdicionaisRepositorio (FolhaDePagamentoDbContext folhaDePagamentoDbContext)
        {
            _dbContext = folhaDePagamentoDbContext;
        }
        public async Task<AdicionaisModel> BuscarPorCodAdicional(int CodAdicional)
        {
#pragma warning disable CS8603 // Possível retorno de referência nula.
            return await _dbContext.Adicionais.FirstOrDefaultAsync(x => x.CodAdicional == CodAdicional);
#pragma warning restore CS8603 // Possível retorno de referência nula.
        }

        public async Task<AdicionaisModel> Adicionar(AdicionaisModel adicionais)
        {
            await _dbContext.Adicionais.AddAsync(adicionais);
            await _dbContext.SaveChangesAsync();
            return adicionais;
        }

        public async Task<AdicionaisModel> Atualizar(AdicionaisModel adicionais, int CodAdicional)
        {
            AdicionaisModel adicionaisPorCod = await BuscarPorCodAdicional(CodAdicional);
            if (adicionaisPorCod == null)
            {
                throw new Exception($"O Adicional para o código: {CodAdicional} não foi encontrado");
            }

            adicionaisPorCod.CodAdicional = adicionais.CodAdicional;
            adicionaisPorCod.MesesTrabalhados = adicionais.MesesTrabalhados;
            adicionaisPorCod.HorasExtras = adicionais.HorasExtras;

            _dbContext.Adicionais.Update(adicionaisPorCod);
            await _dbContext.SaveChangesAsync();
            return adicionaisPorCod;
        }

        public async Task<AdicionaisModel> CalculoAdicionais(AdicionaisModel adicionais, int CodAdicional)
        {
            AdicionaisModel adicionaisPorCod = await BuscarPorCodAdicional(CodAdicional);
            if (adicionaisPorCod == null)
            {
                throw new Exception($"O Adicional para o código: {CodAdicional} não foi encontrado");
            }

            FuncionarioModel funcionario = new FuncionarioModel();
            HoleriteModel holerite =new HoleriteModel();

            salario = funcionario.Salario;

            DecimoTerceiro = (salario/12) * adicionais.MesesTrabalhados;
            salario += DecimoTerceiro;
            salario += adicionais.HorasExtras;

            _dbContext.Adicionais.Update(adicionais);
            _dbContext.Funcionario.Update(funcionario);
            await _dbContext.SaveChangesAsync();

            return adicionaisPorCod;


        }

        public async Task<bool> Apagar(int CodAdicional)
        {
            AdicionaisModel adicionaisPorCod = await BuscarPorCodAdicional(CodAdicional);
            if (adicionaisPorCod == null)
            {
                throw new Exception($"O Adicional para o código: {CodAdicional} não foi encontrado");
            }

            _dbContext.Adicionais.Remove(adicionaisPorCod);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        
    }
}
