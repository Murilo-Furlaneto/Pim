using System.ComponentModel;

namespace FolhaDePagamento.Models
{
    public class GerenteModel
    {
        public int Id { get; set; }
        public long CPF { get; set; }
        public string Nome { get; set; }
        public string Cargo { get; set;}

        [DisplayName("Salário")]
        public float Salario { get; set;}
        [DisplayName("Horas trabalhadas")]
        public float HorasTrabalhadas { get; set;}

        [DisplayName("Comissão")]
        public float Comissao { get; set;}
        public long PIS { get; set;}
        public int RG { get; set;}

        [DisplayName("Certidão de Nascimento")]
        public DateTime? CertNascimento { get; set;}

        [DisplayName("Endereço")]
        public string Endereco { get; set; }
        public string CNH { get; set; }

    }
}
