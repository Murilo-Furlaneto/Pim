using FolhaDePagamento.Models;

namespace FolhaDePagamento.Repositorios.Interfaces
{
    public interface IDescontoRepositorio
    {
        Task<DescontoModel> BuscarPorCodDesconto(int CodDesconto);
        Task<DescontoModel> Adicionar(DescontoModel desconto);
        Task<DescontoModel> Atualizar(DescontoModel desconto, int CodDesconto);
        Task<DescontoModel> CalculoDesconto(DescontoModel desconto, int CodDesconto);
        Task<bool> Apagar(int CodDesconto);
    }
}
