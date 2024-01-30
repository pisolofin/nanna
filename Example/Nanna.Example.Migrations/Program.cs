using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Nanna.Example.Application.Persistance;
using Nanna.Example.Migrations;

var sqlConnection = "Host=localhost;Port=5488;Database=example;Username=postgres;Password=postgres_pwd";

// Create host builder
var host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((context, services) =>
    {
        // Register DbContext
        services.AddDbContext<AppDbContext>(options =>
            options.UseNpgsql(sqlConnection,
            x => x.MigrationsAssembly(typeof(Program).Assembly.FullName)));
    })
    .Build();

await host.Services.ApplyMigrations<AppDbContext>();

// Keep the console window open
Console.ReadLine();
