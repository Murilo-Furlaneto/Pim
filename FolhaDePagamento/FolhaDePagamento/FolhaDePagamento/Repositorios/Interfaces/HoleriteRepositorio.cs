using FolhaDePagamento.Models;

namespace FolhaDePagamento.Repositorios.Interfaces
{
    public interface IHoleriteRepositorio
    {
        Task<List<HoleriteModel>> BuscarPorId(int Id);
        Task<HoleriteModel> BuscarPorCodHolerite(int CodHolerite);
        Task<HoleriteModel> Adicionar(HoleriteModel holerite);
        Task<HoleriteModel> Atualizar(HoleriteModel holerite, int CodHolerite);
        Task<HoleriteModel> GerarHolerite(HoleriteModel holerite);
        Task<bool> Apagar(int CodHolerite);
    }
}
