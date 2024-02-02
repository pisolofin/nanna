using Microsoft.AspNetCore.Builder;

namespace Nanna.AspNetCore.Actions;

public interface IActionEnpointConfigure
{
    public static abstract void Configure(WebApplication app);
}
