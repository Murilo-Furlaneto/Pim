using FolhaDePagamento.Models;

namespace FolhaDePagamento.Repositorios.Interfaces
{
    public interface IGerenteRepositorio 
    {
        Task<GerenteModel> BuscarPorId(int Id);
        Task<GerenteModel> Atualizar(GerenteModel gerente, int Id);
        Task<bool> Apagar(int Id);
    }
}
