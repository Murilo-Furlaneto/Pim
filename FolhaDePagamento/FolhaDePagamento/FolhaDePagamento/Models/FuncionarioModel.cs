using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace FolhaDePagamento.Models
{
    public class FuncionarioModel
    {
        [Key]
        [DisplayName("Código do Funcionário")]
        public int Id { get; set; }
        public string? Nome { get; set; }
        public string? Email { get; set; }
        public long CPF { get; set; }

        [DisplayName("Salário")]
        public float Salario { get; set; }
        public string? Cargo { get; set; }

        [DisplayName("Horas Trabalhadas")]
        public int HorasTrabalhadas { get; set; }

        [DisplayName("Comissão")]
        public float Comissao { get; set; }
        public long PIS { get; set; }
        public string? CNH { get; set; }
        public int RG { get; set; }

        [DisplayName("Certidão de Nascimento")]
        public DateTime? CertNascimento { get; set; }

        [DisplayName("Endereço")]
        public string? Endereco { get; set; }



    }
}

    

