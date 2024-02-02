using Microsoft.AspNetCore.Builder;
using Nanna.Infrastructure;
using System.Reflection;

namespace Nanna.AspNetCore.Actions;

public static class ActionEndpointExtensions
{
    public static void UseActionEndpoints(this WebApplication app, params Assembly[] assemblyToScanList)
    {
        if (assemblyToScanList.Length == 0)
        {
            assemblyToScanList = new Assembly[] { app.GetType().Assembly };
        }

        assemblyToScanList.ExecuteStaticInterfaceMethod(typeof(IActionEnpointConfigure), nameof(IActionEnpointConfigure.Configure), app);
    }
}
