Promise.all = (ps) => {
    if(ps.length <= 0) return Promise.resolve([]);
    const [head, ...tail] = ps;
    return head.then(result => Promise.all(tail).then(results => [result, ...results]));
};

Promise.all = async (ps) => {
    const results = [];
    for (const p of ps) {
        results.push(await p);
    }
    return results;
};

//recurssive 
Promise.all = async (ps) => {
    if (ps.length <= 0) return [];
    const [head, ...tail] = ps;
    return [(await head), ...(await Promise.all(tail))];
};
