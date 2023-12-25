import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import React, { useMemo } from 'react';
import SearchBarWrapper from "../theme/SearchBar";

import Translate, { translate } from '@docusaurus/Translate';

export default function AppPage() {
  const { siteConfig, i18n } = useDocusaurusContext();

  const doSearch = (keyword: string) => {
    window.location.href = `/${i18n.currentLocale !== 'en' ? i18n.currentLocale + '/' : ''}search?q=${keyword}`;
  }



  const tagList = useMemo(() => {
    console.log(i18n.currentLocale);
    if (i18n.currentLocale == 'zh') {
      return [
        {name: '角色'},
        {name: '道具'},
        {name: '键盘'},
        {name: '触摸板'},
        {name: '尾巴'},
        {name: '摄像机'},
        {name: '屏幕'},
        {name: '环境'},
        {name: '光'},
        {name: '锚点'},
        {name: '动作录制器'},
        {name: 'VMC发送器'},
        {name: '蓝图'},
        {name: '动作捕捉'},
      ].sort(function () {
        return Math.random() - 0.5
      })
    }
    return [
    {name: 'Character'},
    {name: 'Prop'},
    {name: 'Keyboard'},
    {name: 'Trackpad'},
    {name: 'Tail'},
    {name: 'Camera'},
    {name: 'Screen'},
    {name: 'Environment'},
    {name: 'Light'},
    {name: 'Anchor'},
    {name: 'Recorder'},
    {name: 'VMCSender'},
    {name: 'Blueprint'},
    {name: 'Motion Capture'}
    ].sort(function () {
      return Math.random() - 0.5
    })
  }, [i18n.currentLocale])


  const text = useMemo(() => {
    if (i18n.currentLocale == 'zh') {
      return ['Warudo 帮助', '推荐内容']
    }
    return ['Warudo Help', 'Suggest Item']
  }, [i18n.currentLocale])

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
              <h1>{text[0]}</h1>
              <div className="search-bar">
                <SearchBarWrapper />
              </div>
            </div>
            <div className="container sug">
              <h3>{text[1]}</h3>
              <div className="sug-list">
                {tagList.map((item) => {
                  return <div className="item" onClick={() => {
                    doSearch(item.name)
                  }}>
                    <h3>{item.name}</h3>
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
