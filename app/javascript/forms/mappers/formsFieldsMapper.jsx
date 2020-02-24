import React from 'react';
import { componentTypes } from '@data-driven-forms/react-form-renderer';
import { formFieldsMapper, components } from '@data-driven-forms/pf3-component-mapper';

import AsyncCredentials from '../../components/async-credentials/async-credentials';
import AsyncProviderCredentials from '../../components/async-credentials/async-provider-credentials';
import DualGroup from '../../components/dual-group';
import DualListSelect from '../../components/dual-list-select';
import EditSecretField from '../../components/async-credentials/edit-secret-field';
import InputWithDynamicPrefix from '../input-with-dynamic-prefix';
import PasswordField from '../../components/async-credentials/password-field';
import { DataDrivenFormCodeEditor } from '../../components/code-editor';

const fieldsMapper = {
  ...formFieldsMapper,
  'code-editor': DataDrivenFormCodeEditor,
  'credentials-password-edit': EditSecretField,
  'dual-group': DualGroup,
  'dual-list-select': DualListSelect,
  'input-with-dynamic-prefix': InputWithDynamicPrefix,
  hr: () => <hr />,
  'password-field': PasswordField,
  'validate-credentials': AsyncCredentials,
  'validate-provider-credentials': AsyncProviderCredentials,
  [componentTypes.SELECT]: props => <components.SelectField classNamePrefix="miq-ddf-select" {...props} />,
};

export default fieldsMapper;
