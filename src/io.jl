export removeExtension, gunzip


"Remove extension from file path"
removeExtension(path::String) = first(Base.Filesystem.splitext(path))


"""
Check if file is gzipped, in which case extract it. Returns original path.
"""
function gunzip(path::String)
    @assert isfile(path) || isfile(path * ".gz")
    if !isfile(path)
        run(`gunzip --keep $(path * ".gz")`)
    end
    return path
end
