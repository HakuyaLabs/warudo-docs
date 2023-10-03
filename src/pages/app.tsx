import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import React from 'react';
import SearchBarWrapper from "../theme/SearchBar";

export default function AppPage() {
  const { siteConfig, i18n } = useDocusaurusContext();

  const doSearch = (keyword: string) => {
      window.location.replace(`/${i18n.currentLocale !== 'en' ? i18n.currentLocale : ''}/search?q=${keyword}`);
  }

  if (i18n.currentLocale == 'zh') { }

  const tagListZH = [
    'Camera',
    'Keyboard/TrackPad'
  ]

  const tagListEN = ['Camera', '']

  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Description will go into a meta tag in <head />">
      <main>
        <style>

        </style>
        <div className="in-app-page">
          <div className="main">
            <div className="container">
              <h1>{i18n.currentLocale == 'zh' ? 'Warudo 帮助' : 'Warudo Help'}</h1>
              <div className="search-bar">
              <SearchBarWrapper />
              </div>
            </div>
            <div className="container sug">
              <h3>推荐内容</h3>
            <div className="sug-list">
              {tagListZH.map((item) => {
                return  <div className="item" onClick={() => {
                  doSearch(item.title)
                }}>
                  <h3>{item.title}</h3>
                  <p>{item.description}</p>
                </div>
              })}
              </div>
            </div>
          </div>
        </div>
      </main>
    </Layout>
  )
}