using FolhaDePagamento.Data;
using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento.Repositorios
{
    public class HoleriteRepositorio : IHoleriteRepositorio
    {
        private readonly FolhaDePagamentoDbContext _dbContext;
        public HoleriteRepositorio(FolhaDePagamentoDbContext folhaDePagamentoDbContext)
        {
            _dbContext = folhaDePagamentoDbContext;
        }

        public async Task<HoleriteModel> BuscarPorCodHolerite(int CodHolerite)
        {
            return await _dbContext.Holerite.FirstOrDefaultAsync(x => x.CodHolerite == CodHolerite);
        }

        public async Task<List<HoleriteModel>>BuscarPorId(int Id)
        {
            return await _dbContext.Holerite.ToListAsync();
        }
        public async Task<HoleriteModel> Adicionar(HoleriteModel holerite)
        {
            await _dbContext.Holerite.AddAsync(holerite);
            await _dbContext.SaveChangesAsync();
            return holerite;
        }
        public async Task<HoleriteModel> Atualizar(HoleriteModel holerite, int CodHolerite)
        {
            HoleriteModel holeritePorCod = await BuscarPorCodHolerite(CodHolerite);
            if (holeritePorCod == null)
            {
                throw new Exception($"O Holerite para o código: {CodHolerite} não foi encontrado");
            }

            holeritePorCod.CodHolerite = holerite.CodHolerite;
            holeritePorCod.DataReferencia = holerite.DataReferencia;
            holeritePorCod.Id = holerite.Id;

            _dbContext.Holerite.Update(holeritePorCod);
            await _dbContext.SaveChangesAsync();
            return holeritePorCod;
        }
        public async Task<bool> Apagar(int CodHolerite)
        {
            HoleriteModel holeritePorCod = await BuscarPorCodHolerite(CodHolerite);
            if (holeritePorCod == null)
            {
                throw new Exception($"O holerite para o código: {CodHolerite} não foi encontrado");
            }

            _dbContext.Holerite.Remove(holeritePorCod);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        public Task<HoleriteModel> GerarHolerite(HoleriteModel holerite)
        {
            throw new NotImplementedException();
        }
    }
}
