using Microsoft.AspNetCore.Mvc;
using Nanna.Exceptions;
using System.Net;

namespace Nanna.AspNetCore.Exceptions;

public class LoginFailedException : DomainException
{
    private string Id { get; }
    private string Title { get; }

    public LoginFailedException(AppErrorType id, string title)
    {
        Id = id;
        Title = title;
    }

    public sealed override ProblemDetails ToProblemDetails()
    {
        return new ProblemDetails
        {
            Title = Title,
            Status = (int?)HttpStatusCode.Unauthorized,
            Extensions = { { "id", Id } }
        };
    }
}
