import {useDoc} from '@docusaurus/theme-common/internal';

export interface AuthorData {
  name: string,
  github: string
}

export function AuthorBar(props: {
  authors: {
    [key in 'creators' | 'translators']: AuthorData[]
  };
}) {
  const {authors} = props;
  const {metadata} = useDoc();
  const {lastUpdatedAt, lastUpdatedBy, tags, source} = metadata;
console.log(metadata);
  return (
    <div className="doc-author-bar">
      <div className="line">
        <p>Authors</p>
      {authors.creators.map((author) => {
        return (
          <a href={`https://github.com/${author.github}`}>
          <div className="person">
            <img src={`https://unavatar.io/github/${author.github}`} />
            <span>{author.name}</span>
          </div>
          </a>
        )
      })}
      </div>
      <div className="line">
      <p>Translators</p>
      {authors.translators.map((author) => {
        return (
          <a href={`https://github.com/${author.github}`}>
          <div className="person">
            <img src={`https://unavatar.io/github/${author.github}`} />
            <span>{author.name}</span>
          </div>
          </a>
        )
      })}
      </div>
      <div className="line">
        Last updated on {lastUpdatedAt}<br />
        <a href={`https://github.com/HakuyaLabs/warudo-doc/edit/master/${source.replace('@site/', '')}`}>Edit on Github</a>
      </div>
    </div>
  );
}