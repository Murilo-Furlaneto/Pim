using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FolhaDePagamento.Migrations
{
    public partial class InitialDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Adicionais",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    CodAdicional = table.Column<int>(type: "INTEGER", nullable: false),
                    DecimoTerceiro = table.Column<float>(type: "REAL", nullable: false),
                    HorasExtras = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Adicionais", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Desconto",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    CodDesconto = table.Column<int>(type: "INTEGER", nullable: false),
                    TaxaInss = table.Column<float>(type: "REAL", nullable: false),
                    Irrf = table.Column<float>(type: "REAL", nullable: false),
                    Vt = table.Column<float>(type: "REAL", nullable: false),
                    FGTS = table.Column<float>(type: "REAL", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Desconto", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Funcionario",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Nome = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    CPF = table.Column<long>(type: "INTEGER", nullable: false),
                    Salario = table.Column<float>(type: "REAL", nullable: false),
                    Cargo = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    HorasTrabalhadas = table.Column<int>(type: "INTEGER", nullable: false),
                    Comissao = table.Column<float>(type: "REAL", nullable: false),
                    PIS = table.Column<long>(type: "INTEGER", nullable: false),
                    CNH = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    RG = table.Column<int>(type: "INTEGER", nullable: false),
                    CertNascimento = table.Column<DateTime>(type: "TEXT", maxLength: 255, nullable: false),
                    Endereco = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Funcionario", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Gerente",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    CPF = table.Column<long>(type: "INTEGER", nullable: false),
                    Nome = table.Column<string>(type: "TEXT", nullable: false),
                    Cargo = table.Column<string>(type: "TEXT", nullable: false),
                    Salario = table.Column<float>(type: "REAL", nullable: false),
                    HorasTrabalhadas = table.Column<float>(type: "REAL", nullable: false),
                    Comissao = table.Column<float>(type: "REAL", nullable: false),
                    PIS = table.Column<long>(type: "INTEGER", nullable: false),
                    RG = table.Column<int>(type: "INTEGER", nullable: false),
                    CertNascimento = table.Column<DateTime>(type: "TEXT", nullable: true),
                    Endereco = table.Column<string>(type: "TEXT", nullable: false),
                    CNH = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Gerente", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Holerite",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    CodHolerite = table.Column<int>(type: "INTEGER", nullable: false),
                    DataReferencia = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Holerite", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Adicionais");

            migrationBuilder.DropTable(
                name: "Desconto");

            migrationBuilder.DropTable(
                name: "Funcionario");

            migrationBuilder.DropTable(
                name: "Gerente");

            migrationBuilder.DropTable(
                name: "Holerite");
        }
    }
}
