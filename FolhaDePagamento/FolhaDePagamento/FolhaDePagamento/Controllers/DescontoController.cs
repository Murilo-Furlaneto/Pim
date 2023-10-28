using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FolhaDePagamento.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DescontoController : ControllerBase
    {
        private readonly IDescontoRepositorio _descontoRepositorio;

        public DescontoController(IDescontoRepositorio descontoRepositorio)
        {
            _descontoRepositorio = descontoRepositorio;
        }

        [HttpGet]
        public async Task<ActionResult<DescontoModel>> BuscarPorCodDesconto(int CodDesconto)
        {
            DescontoModel desconto = await _descontoRepositorio.BuscarPorCodDesconto(CodDesconto);
            return Ok(desconto);
        }


        [HttpPost("{Inserir descontos}")]
        public async Task<ActionResult<DescontoController>> Inserir([FromBody] DescontoModel descontoModel)
        {
            DescontoModel desconto = await _descontoRepositorio.Adicionar(descontoModel);
            return Ok(desconto);

        }


    }
}
