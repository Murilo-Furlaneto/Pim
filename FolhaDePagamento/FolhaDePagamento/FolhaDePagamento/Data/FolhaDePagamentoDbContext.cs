using FolhaDePagamento.Data.Map;
using FolhaDePagamento.Models;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento.Data
{
    public class FolhaDePagamentoDbContext : DbContext 
    {
        public FolhaDePagamentoDbContext(DbContextOptions<FolhaDePagamentoDbContext>options) : base(options)
        {
        }

        public DbSet<FuncionarioModel> Funcionario { get; set; }
        public DbSet<HoleriteModel> Holerite { get; set; }
        public DbSet<DescontoModel> Desconto { get; set; }
        public DbSet<GerenteModel> Gerente { get; set; }
        public DbSet<AdicionaisModel> Adicionais { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new FuncionarioMap());
            modelBuilder.ApplyConfiguration(new GerenteMap());
            modelBuilder.ApplyConfiguration(new HoleriteMap());
            modelBuilder.ApplyConfiguration(new DescontoMap());
            modelBuilder.ApplyConfiguration(new AdicionaisMap());
            base.OnModelCreating(modelBuilder);
        }

    }
}
