using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FolhaDePagamento.Data.Map
{
    public class FuncionarioMap : IEntityTypeConfiguration<FuncionarioModel>
    {
        public void Configure(EntityTypeBuilder<FuncionarioModel> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(x => x.Nome).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Cargo).IsRequired().HasMaxLength(255);
            builder.Property(x => x.CPF);
            builder.Property(x => x.Salario);
            builder.Property(x => x.HorasTrabalhadas);
            builder.Property(x => x.Comissao);
            builder.Property(x => x.PIS);
            builder.Property(x => x.CNH).IsRequired().HasMaxLength(255);
            builder.Property(x => x.RG);
            builder.Property(x => x.CertNascimento).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Endereco).IsRequired().HasMaxLength(255);

        }
    }
}