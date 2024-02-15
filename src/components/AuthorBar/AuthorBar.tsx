export interface AuthorData {
  name: string,
  email: string,
}

export function AuthorBar(props: {
  authors: {
    [key in 'creator' | 'translator']: AuthorData[]
  }[];
}) {
  const {authors} = props;
  return (
    <div className="doc-author-bar">
      {authors.map((author) => {
        return (
          <div className=""></div>
        )
      })}
    </div>
  );
}