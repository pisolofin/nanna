using Nanna.Example.WebAPI.Startup;
using Nanna.Serilog;
using Nanna.AspNetCore.Cors;
using Nanna.AspNetCore.Exceptions;
using Nanna.AspNetCore.Localizations;
using Nanna.Swagger;
using Serilog;
using System.Text.Json.Serialization;
using Nanna.Example.Endpoints;
using Nanna.EntityFramework;
using Nanna.Example.Application.Persistance;
using Nanna.AspNetCore.Actions;
using Nanna.AutoMapper ;

var builder = WebApplication.CreateBuilder(args);

// Assembly.Load("BMGroup.JADA.Application");
// var currentDomain = AppDomain.CurrentDomain;
// var allAssemblies = currentDomain.GetAssemblies().ToList();
// allAssemblies.RemoveAll(
//     assembly =>
//         assembly.FullName != null
//         && (
//             assembly.FullName.StartsWith("Microsoft.", StringComparison.OrdinalIgnoreCase)
//             || assembly.FullName.StartsWith("FastEndpoints.", StringComparison.OrdinalIgnoreCase)
//             || assembly.FullName.StartsWith("System.", StringComparison.OrdinalIgnoreCase)
//         )
// );
// currentDomain.SetData("REGEX_DEFAULT_MATCH_TIMEOUT", TimeSpan.FromSeconds(1));

// Add logging, CORS, Swagger, and localization
builder.AddLoggingSerilog();
builder.AddCors();
builder.AddSwagger();
builder.AddLocalization();
builder.Services.AddAutoMapperAndConfig([typeof(Nanna.Example.ApplicationWeb.Reference).Assembly]);

// Add services to the container.
builder.Services.AddAppDbContext(typeof(Nanna.Example.ApplicationWeb.Reference).Assembly);

// Build the application
var app = builder.Build();

// Exception handling and logging middleware
app.UseExceptionHandler(new ExceptionHandlerOptions { ExceptionHandler = ExceptionHandler.HandleException, AllowStatusCode404Response = true });

// Logger
app.UseLogEnrichment();
app.UseSerilogRequestLogging();

// Redirect to HTTPS and configure routing
if (!builder.Environment.IsDevelopment())
{
    app.UseHttpsRedirection();
}

// Swagger for development
if (!builder.Environment.IsProduction())
{
    app.UseOpenApi(); // serve OpenAPI/Swagger documents
    app.UseSwaggerUi(); // serve Swagger UI
//    app.UseReDoc(); // serve ReDoc UI
}

// Configure the HTTP request pipeline.
app.UseRoomEndpoints();
app.UseActionEndpoints(AppDomain.CurrentDomain.GetAssemblies());
//Nanna.Example.ApplicationWeb.Devices.Actions.GetDevices.Configure(app);

await app.Services.ApplyMigrations<AppDbContext>();

var sampleTodos = new Todo[] {
    new(1, "Walk the dog"),
    new(2, "Do the dishes", DateOnly.FromDateTime(DateTime.Now)),
    new(3, "Do the laundry", DateOnly.FromDateTime(DateTime.Now.AddDays(1))),
    new(4, "Clean the bathroom"),
    new(5, "Clean the car", DateOnly.FromDateTime(DateTime.Now.AddDays(2)))
};

var todosApi = app.MapGroup("/todos");
todosApi.MapGet("/", () => sampleTodos);
todosApi.MapGet("/{id}", (int id) =>
    sampleTodos.FirstOrDefault(a => a.Id == id) is { } todo
        ? Results.Ok(todo)
        : Results.NotFound());



app.Run();

public record Todo(int Id, string? Title, DateOnly? DueBy = null, bool IsComplete = false);

[JsonSerializable(typeof(Todo[]))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{

}
