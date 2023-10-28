using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FolhaDePagamento.Data.Map
{
    public class HoleriteMap : IEntityTypeConfiguration<HoleriteModel>
    {
        public void Configure(EntityTypeBuilder<HoleriteModel> builder)
        {
            builder.HasKey(x => x.CodHolerite);
            builder.Property(x => x.DataReferencia).IsRequired();
            builder.HasKey(x => x.Id);
        }
    }
}
