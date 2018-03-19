// src/Routes.js

import React from 'react';
import { Switch, HashRouter as Router, Route } from 'react-router-dom';
import createBrowserHistory from 'history/createBrowserHistory';

import BookIndex from './Post/Index';
import BookNew from './Post/New';
import BookEdit from './Post/Edit';
import NotFound from './NotFound';

const history = createBrowserHistory();
const Routes = () =>
<Router history={history}>
    <Switch>
    <Route path="/posts/:id/edit" component={PostEdit} />
<Route path="/posts/new" component={PostNew} />
<Route path="/posts/" component={PostIndex} />
<Route path="*" component={NotFound} />
</Switch>
</Router>;

export default Routes;