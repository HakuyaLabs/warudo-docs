export interface AuthorData {
  name: string,
  email: string,
  link?: string,
}

export function AuthorBar(props: {
  authors: {
    [key in 'creators' | 'translators']: AuthorData[]
  };
}) {
  const {authors} = props;

  const person = [];
  return (
    <div className="doc-author-bar">
      <div className="line">
        <p>作者</p>
      {authors.creators.map((author) => {
        return (
          <div className="person"></div>
        )
      })}
      </div>
      <div className="line">
      <p>译者</p>
      {authors.translators.map((author) => {
        return (
          <div className=""></div>
        )
      })}
      </div>
    </div>
  );
}