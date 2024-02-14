using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Nanna.Example.ApplicationWeb.Migrations
{
    /// <inheritdoc />
    public partial class Manufacture : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ManufactureId",
                table: "Device",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Manufacture",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Manufacture", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Device_ManufactureId",
                table: "Device",
                column: "ManufactureId");

            migrationBuilder.AddForeignKey(
                name: "FK_Device_Manufacture_ManufactureId",
                table: "Device",
                column: "ManufactureId",
                principalTable: "Manufacture",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Device_Manufacture_ManufactureId",
                table: "Device");

            migrationBuilder.DropTable(
                name: "Manufacture");

            migrationBuilder.DropIndex(
                name: "IX_Device_ManufactureId",
                table: "Device");

            migrationBuilder.DropColumn(
                name: "ManufactureId",
                table: "Device");
        }
    }
}
