using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FolhaDePagamento.Data.Map
{
    public class DescontoMap : IEntityTypeConfiguration<DescontoModel>
    {
        public void Configure(EntityTypeBuilder<DescontoModel> builder)
        {
            builder.HasKey(x => x.CodDesconto);
            builder.Property(x => x.TaxaInss).IsRequired();
            builder.Property(x => x.Irrf).IsRequired();
            builder.Property(x => x.Vt).IsRequired();
            builder.Property(x => x.FGTS).IsRequired();
            builder.HasKey(x => x.Id);

        }
    }
}
