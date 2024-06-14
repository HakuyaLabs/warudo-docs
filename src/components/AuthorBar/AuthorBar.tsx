import { useDoc } from '@docusaurus/theme-common/internal';
import dayjs from 'dayjs';
import { IoCreateOutline } from 'react-icons/io5';

export interface AuthorData {
  name: string,
  github: string
}

export function AuthorBar(props: {
  authors: {
    [key in 'creators' | 'translators']: AuthorData[]
  };
}) {
  const { authors } = props;
  const { metadata } = useDoc();
  const { lastUpdatedAt, lastUpdatedBy, tags, source } = metadata;
  return (
    <div className="doc-author-bar">
      <div className="line bar-title">
        <h2>Contributions</h2>
        <a href={`https://github.com/HakuyaLabs/warudo-doc/edit/master/${source.replace('@site/', '')}`}>
          <span className="icon"><IoCreateOutline /></span> Edit on Github
        </a>
      </div>
      {authors.creators.length ? (
      <div className="line">
        <p className="title">Authors</p>
        <div className="persons">
          {authors.creators.map((author) => {
            return (
              <a target='_blank' href={`https://github.com/${author.github}?utm_source=docs.warudo.app`}>
                <div className="person">
                  <img src={`https://unavatar.io/github/${author.github}`} />
                  <span>{author.name}</span>
                </div>
              </a>
            )
          })}
        </div>
      </div>
       ) : null}
      {authors.translators.length ? (
      <div className="line">
        <p className="title">Translators</p>
        <div className="persons">
          {authors.translators.map((author) => {
            return (
              <a target='_blank' href={`https://github.com/${author.github}?utm_source=docs.warudo.app`}>
                <div className="person">
                  <img src={`https://unavatar.io/github/${author.github}`} />
                  <span>{author.name}</span>
                </div>
              </a>
            )
          })}
        </div>
      </div>
      ) : null}
      <div className="line last-updated">
        <span>Last updated on {dayjs(lastUpdatedAt).format('YYYY.MM.DD')}</span>
      </div>
    </div>
  );
}