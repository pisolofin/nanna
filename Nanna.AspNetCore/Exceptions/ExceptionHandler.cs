using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Nanna.Exceptions;
using System.Diagnostics;
using System.Net;

namespace Nanna.AspNetCore.Exceptions;

public class ExceptionHandler
{
    public static async Task HandleException(HttpContext context)
    {
        var exception = context.Features.Get<IExceptionHandlerFeature>();
        if (exception == null)
        {
            return ;
        }

        Debug.WriteLine($"ERROR : {exception.Error.Message}");

        switch (exception.Error)
        {
            case UnauthorizedAccessException:
                await Results.Unauthorized().ExecuteAsync(context);
                break;
            case ForbiddenException:
                await Results.Forbid().ExecuteAsync(context);
                break;

            case NotFoundException:
                await Results.NotFound().ExecuteAsync(context);
                break;
            default:
            {
                if (exception.Error is DomainException domainException)
                {
                    var details = domainException.ToProblemDetails();
                    details.Status ??= (int?)HttpStatusCode.BadRequest;
                    await Results.Problem(details).ExecuteAsync(context);
                }
                else
                {
                    var logger = context.RequestServices.GetService<ILogger<ExceptionHandler>>();
                    logger?.LogError(exception.Error, "Unhandled exception");
                    await Results.StatusCode(500).ExecuteAsync(context);
                }

                break;
            }
        }
    }
}
