using FolhaDePagamento.Controllers;
using FolhaDePagamento.Models;

namespace FolhaDePagamento.Repositorios.Interfaces
{
    public interface IFuncionarioRepositorio
    {
        Task<List<FuncionarioModel>> BuscarTodosFuncionarios();
        Task<FuncionarioModel> BuscarPorId(int Id);
        Task<FuncionarioModel> Adicionar(FuncionarioModel funcionario);
        Task<FuncionarioModel> Atualizar(FuncionarioModel funcionario, int Id);
        Task<bool> Apagar(int Id);
    }
}
