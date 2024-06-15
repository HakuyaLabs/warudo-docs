import Translate from '@docusaurus/Translate';
import { useDoc } from '@docusaurus/theme-common/internal';
import dayjs from 'dayjs';
import { useMemo } from 'react';
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
  console.log(metadata);

  const isNotFoundTranslate = useMemo(() => {
    if(metadata.permalink.startsWith('/zh') && metadata.source.indexOf('i18n/zh') < 0) {
      return true;
    }
    if(metadata.permalink.startsWith('/jp') && metadata.source.indexOf('i18n/jp') < 0) {
      return true;
    }
    return false;
  }, [metadata]);

  return (
    <div className="doc-author-bar">
      <div className="line bar-title">
        <h2><Translate id="authbar.contributions">Contributions</Translate></h2>
        <a href={`https://github.com/HakuyaLabs/warudo-doc/edit/master/${source.replace('@site/', '')}`}>
          <span className="icon"><IoCreateOutline /></span> Edit on Github
        </a>
      </div>
      {isNotFoundTranslate ? (
        <div className="line no-translate">
          <h3>
          <Translate
            id="authbar.contributions.untranslated.title"
            description='This title shows at bottom of doc page which not translated and used its english version.'
          >
            Help us improve handbook!
          </Translate></h3>
          <p><Translate
            id="authbar.contributions.untranslated.message"
            description='This message shows at bottom of doc page which not translated and used its english version.'
          >
            The page you are reading does not have a version in the language you selected. Please help us translate it!
          </Translate></p>
          </div>
      ): null}
      {authors.creators.length ? (
      <div className="line">
        <p className="title"><Translate id="authbar.contributions.authors">Authors</Translate></p>
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
        <p className="title"><Translate id="authbar.contributions.translators">Translators</Translate></p>
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
        <span><Translate id="authbar.lastUpdated">Last updated on</Translate> {dayjs(lastUpdatedAt).format('YYYY.MM.DD')}</span>
      </div>
    </div>
  );
}