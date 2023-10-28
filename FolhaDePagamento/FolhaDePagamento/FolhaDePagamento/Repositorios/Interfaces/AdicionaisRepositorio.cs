using FolhaDePagamento.Models;

namespace FolhaDePagamento.Repositorios.Interfaces
{
    public interface IAdicionaisRepositorio
    {
   
        Task<AdicionaisModel> BuscarPorCodAdicional(int CodAdicional);
        Task<AdicionaisModel> Adicionar(AdicionaisModel adicionais);
        Task<AdicionaisModel> Atualizar(AdicionaisModel adicionais, int CodAdicional);
        Task<AdicionaisModel> CalculoAdicionais(AdicionaisModel adicionais, int CodAdicional);
        Task<bool> Apagar(int CodAdicional);
    }
}
