using System.ComponentModel;

namespace FolhaDePagamento.Models
{
    public class DescontoModel
    {
        [DisplayName("Código do Desconto")]
        public int CodDesconto { get; set; }
        [DisplayName("INSS")]
        public float TaxaInss {  get; set; }
        [DisplayName("IRRF")]
        public float Irrf { get; set; }
        public int Faltas { get; set; }

        [DisplayName("Vale transporte")]
        public float Vt {  get; set; } 
        
        public float FGTS { get; set; }
        public int Id { get; set; }
    }
}


