Promise.all([fetchUserSearchResults])
  .then(({ 0: res }) => {
    const searchResults = Object.keys(res)
      .map(key => res[key]['json-service']['services'][0].response.data
        .map(([SSO, name, ifg, email]) => {
          const [last, first] = name.split(',').map(str => str.trim());
          return {
            SSO,
            name: `${first} ${last}`,
            ifg,
            email
          }
        }))
        .map(arr => arr[0])
  });