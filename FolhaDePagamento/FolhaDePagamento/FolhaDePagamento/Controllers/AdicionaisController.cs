using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FolhaDePagamento.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdicionaisController : ControllerBase
    {
        private readonly IAdicionaisRepositorio _adicionaisRepositorio;

        public AdicionaisController(IAdicionaisRepositorio adicionaisRepositorio)
        {
            _adicionaisRepositorio = adicionaisRepositorio;
        }

        [HttpGet("{Buscar por Cod. Adicional}")]
        public async Task<ActionResult<AdicionaisModel>> BuscarPorCodAdicional(int CodAdicional)
        {
            AdicionaisModel adicionais = await _adicionaisRepositorio.BuscarPorCodAdicional(CodAdicional);
            return Ok(adicionais);
        }

       

        [HttpPost("{Inserir Adicionais}")]
        public async Task<ActionResult<AdicionaisModel>> InserirAdicional([FromBody] AdicionaisModel adicional)
        {
            AdicionaisModel adicionais = await _adicionaisRepositorio.Adicionar(adicional);
            return Ok(adicionais);

        }



    }
   
}
