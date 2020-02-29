python tests / Mocks :


from unittest.mock import patch, Mock, MagicMock



m = Mock()
m.__iter__ = Mock(return_value = iter([3, 5]))

