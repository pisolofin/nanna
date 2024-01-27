namespace Nanna.Exceptions;

public class AppErrorType
{
    private readonly string _errorType;

    public AppErrorType(string errorType)
    {
        _errorType = errorType;
    }

    public override bool Equals(object? obj)
    {
        return Equals(obj as AppErrorType);
    }

    private bool Equals(AppErrorType? other)
    {
        return other is not null && _errorType == other._errorType;
    }

    public override int GetHashCode()
    {
        return _errorType.GetHashCode();
    }

    public static implicit operator string(AppErrorType errorType)
    {
        return errorType._errorType;
    }
}
