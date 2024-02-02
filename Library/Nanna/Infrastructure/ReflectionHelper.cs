using System.Reflection;

namespace Nanna.Infrastructure;

public static class ReflectionHelper
{
    public static void ExecuteStaticInterfaceMethod(this IEnumerable<Assembly> assemblyToScanList, Type interfaceType, string methodName, params object[] args)
    {
        var actionEnpointList = assemblyToScanList
            .SelectMany(assembly => assembly.GetTypes())
            .Where(type => interfaceType.IsAssignableFrom(type) && !type.IsInterface && !type.IsAbstract)
        ;
        foreach (var actionEnpoint in actionEnpointList)
        {
            actionEnpoint.GetMethod(methodName, BindingFlags.Public | BindingFlags.Static)?.Invoke(null, args);
        }
    }
}
