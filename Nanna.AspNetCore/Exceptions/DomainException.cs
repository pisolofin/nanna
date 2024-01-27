using Microsoft.AspNetCore.Mvc;

namespace Nanna.AspNetCore.Exceptions;

public abstract class DomainException : Exception
{
    public abstract ProblemDetails ToProblemDetails();
}
