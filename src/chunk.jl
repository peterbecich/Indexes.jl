# Chunk
# =====
#
# Consecutive range of BGZF files.
#
# This file is a part of BioJulia.
# License is MIT: https://github.com/BioJulia/Bio.jl/blob/master/LICENSE.md

# BGZF file chunk [.start, .stop).
struct Chunk
    start::BGZFStreams.VirtualOffset
    stop::BGZFStreams.VirtualOffset
end

function Base.in(voffset::BGZFStreams.VirtualOffset, chunk::Chunk)
    return chunk.start ≤ voffset < chunk.stop
end

function Base.:(==)(chunk1::Chunk, chunk2::Chunk)
    return chunk1.start == chunk2.start && chunk1.stop == chunk2.stop
end

function Base.isless(chunk1::Chunk, chunk2::Chunk)
    return (
        isless(chunk1.start, chunk2.start) ||
        (chunk1.start == chunk2.start && isless(chunk1.stop, chunk2.stop)))
end

function Base.seek(stream::BGZFStreams.BGZFStream, chunk::Chunk)
    seek(stream, chunk.start)
end
