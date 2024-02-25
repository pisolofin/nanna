using NSwag.Generation.Processors;
using NSwag.Generation.Processors.Contexts;

namespace Nanna.Swagger.OperationProcessor;

public class AllOptionalParametersOperationProcessor : IOperationProcessor
{
    public bool Process(OperationProcessorContext context)
    {
        foreach (var operationDescription in context.AllOperationDescriptions)
        {
            foreach (var parameter in operationDescription.Operation.Parameters)
            {
                parameter.IsRequired = false;
            }
        }

        return true;
    }
}
