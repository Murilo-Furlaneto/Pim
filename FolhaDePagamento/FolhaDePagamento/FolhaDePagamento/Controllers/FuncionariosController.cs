using FolhaDePagamento.Models;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FolhaDePagamento.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FuncionariosController : ControllerBase
    {
        private readonly IFuncionarioRepositorio _funcionarioRepositorio;

        public FuncionariosController(IFuncionarioRepositorio funcionarioRepositorio)
        {
            _funcionarioRepositorio = funcionarioRepositorio;
        }

        [HttpGet]
        public async Task<ActionResult<List<FuncionarioModel>>>BuscarTodosFuncionarios()
        {
            List<FuncionarioModel> funcionarios = await _funcionarioRepositorio.BuscarTodosFuncionarios();
            return Ok(funcionarios);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<FuncionarioModel>> BuscarPorId(int Id)
        {
            FuncionarioModel funcionario = await _funcionarioRepositorio.BuscarPorId(Id);
            return Ok(funcionario);
        }

        [HttpPost("{Atualizar cadastro}")]
        public async Task<ActionResult<FuncionarioModel>> AtualizarCadastro([FromBody] FuncionarioModel funcionarioModel, int Id)
        {
            FuncionarioModel funcionario = await _funcionarioRepositorio.Atualizar(funcionarioModel, Id);
            return Ok(funcionario);

        }
        [HttpPost("Cadastrar Funcionario")]

        public async Task<ActionResult<FuncionarioModel>> Cadastrar([FromBody] FuncionarioModel funcionarioModel)
        {
            FuncionarioModel funcionario =  await _funcionarioRepositorio.Adicionar(funcionarioModel);
            return Ok(funcionario);

        }

        
    }
}
