using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FolhaDePagamento.Data.Map
{
    public class GerenteMap : IEntityTypeConfiguration<GerenteModel>
    {
        public void Configure(EntityTypeBuilder<GerenteModel> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(x => x.CPF).IsRequired();
            builder.Property(x => x.Nome).IsRequired().HasMaxLength(40);
            builder.Property(x => x.Cargo).IsRequired().HasMaxLength(60);
            builder.Property(x => x.Salario).IsRequired();
            builder.Property(x => x.HorasTrabalhadas).IsRequired();
            builder.Property(x => x.Comissao).IsRequired();
            builder.Property(x => x.PIS).IsRequired();
            builder.Property(x => x.RG).IsRequired();
            builder.Property(x => x.CertNascimento).IsRequired();
            builder.Property(x => x.Endereco).IsRequired().HasMaxLength(100);
            builder.Property(x => x.CNH).IsRequired().HasMaxLength(20);


        }
    }
}
