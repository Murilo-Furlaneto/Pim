using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FolhaDePagamento.Data.Map
{
    public class AdicionaisMap : IEntityTypeConfiguration<AdicionaisModel>
    {
        public void Configure(EntityTypeBuilder<AdicionaisModel> builder)
        {
            builder.HasKey(x => x.CodAdicional);
            builder.HasKey(x => x.Id);
            builder.Property(x => x.MesesTrabalhados).IsRequired();
            builder.Property(x => x.HorasExtras).IsRequired();


        }
    }
}
