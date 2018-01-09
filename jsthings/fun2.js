defaultSortMethod={
  (
    {
      props: { children: [, { props: { user: { name: a } } }] }
    },
    {
      props: { children: [, { props: { user: { name: b } } }] }
    }
  ) => {
      // force null and undefined to the bottom
      a = (a === null || a === undefined) ? -Infinity : a;
      b = (b === null || b === undefined) ? -Infinity : b;

      // force any string values to lowercase
      a = a === 'string' ? a.toLowerCase() : a;
      b = b === 'string' ? b.toLowerCase() : b;

      // Return either 1 or -1 to indicate a sort priority
      if (a > b) return 1;
      if (a < b) return -1;

      // returning 0, undefined or any falsey value will use subsequent sorts or the index as a tiebreaker
      return 0;
    }
}