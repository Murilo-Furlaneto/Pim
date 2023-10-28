using System.ComponentModel;

namespace FolhaDePagamento.Models
{
    public class AdicionaisModel
    {
        [DisplayName("Código Adicional")]
        public int CodAdicional { get; set; }

        [DisplayName("Meses trabalhados")]
        public float MesesTrabalhados { get; set; }

        [DisplayName("Horas extras")]
        public int HorasExtras { get; set; }
        public int Id { get; set; }

    }
}
