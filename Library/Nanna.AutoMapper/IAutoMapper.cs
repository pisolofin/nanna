using AutoMapper;

namespace Nanna.AutoMapper;

public interface IAutoMapper
{
    static abstract void ConfigureAutoMapper(IMapperConfigurationExpression mapping);
}
