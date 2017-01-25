from jsonrpc import jsonrpc_method

@jsonrpc_method('add')
def add(request, part1, part2):
    return part1 + part2
