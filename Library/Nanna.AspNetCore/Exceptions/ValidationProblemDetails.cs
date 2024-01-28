using Microsoft.AspNetCore.Mvc;

namespace Nanna.AspNetCore.Exceptions;

public class ValidationProblemDetails : ProblemDetails
{
    public List<string> ValidationErrors { get; set; }

    public ValidationProblemDetails(List<string> validationErrors)
    {
        ValidationErrors = validationErrors;
    }
}
