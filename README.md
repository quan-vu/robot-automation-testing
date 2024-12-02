# Automated Testing with Robot Framework

Robot Framework is a versatile, keyword-driven test automation framework. It supports a wide range of test cases, including end-to-end (E2E) testing for web, API, and other types of systems. This tutorial walks you through setting up Robot Framework for E2E testing, writing test cases, and running tests.

This repository contains the code for the Automated Testing with Robot Framework.

### Prerequisites

- Python (3.10) installed on your system.
- Basic understanding of Python and testing concepts.
- A web application to test (for example, The Internet demo site).

## Installation

1. Start env use poetry

```bash
cd robot_automation_testing
poetry shell
```

2. Install dependencies

```bash
poetry add robotframework=6.0.2 robotframework-seleniumlibrary=6.0.0
```

3. Run the test

```bash
poetry run robot --outputdir reports src/test_suites/
```

## Resolve Common Errors

### 1/ The error [FAIL] TypeError: WebDriver.**init**() got an unexpected keyword argument 'service_log_path'

This error occurs because recent versions of the Selenium WebDriver have deprecated or changed how certain arguments are passed to the WebDriver initialization.

This often arises when there's a mismatch between the versions of SeleniumLibrary, selenium, or the browser's WebDriver.

Here’s how to resolve it:

```bash
pip install --upgrade robotframework-seleniumlibrary selenium
```
