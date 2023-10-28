using FolhaDePagamento.Data;
using FolhaDePagamento.Repositorios;
using FolhaDePagamento.Repositorios.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FolhaDePagamento
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            builder.Services.AddRazorPages();
            builder.Services.AddDbContext<FolhaDePagamentoDbContext>(options => options.UseSqlite(
                builder.Configuration.GetConnectionString("DataBase")));

            builder.Services.AddScoped<IFuncionarioRepositorio, FuncionarioRepositorio>(); 

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}