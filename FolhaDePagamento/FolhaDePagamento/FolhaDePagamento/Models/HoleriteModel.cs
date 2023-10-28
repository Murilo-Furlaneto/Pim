using System.ComponentModel;

namespace FolhaDePagamento.Models
{
    public class HoleriteModel
    {
        [DisplayName("Código do Holerite")]
        public int CodHolerite { get; set; }

        public DateTime? DataReferencia { get; set; }

        [DisplayName("Código do Funcionário")]
        public int Id { get; set; }

    }
}
